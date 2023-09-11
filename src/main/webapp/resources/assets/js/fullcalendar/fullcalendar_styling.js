/* ------------------------------------------------------------------------------
 *
 *  # Fullcalendar basic options
 *
 *  Demo JS code for extra_fullcalendar_styling.html page
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

const FullCalendarStyling = function() {


    //
    // Setup module components
    //

    // External events
    const _componentFullCalendarStyling = function() {
        if (typeof FullCalendar == 'undefined') {
            console.warn('Warning - Fullcalendar files are not loaded.');
            return;
        }


        // Add events
        // ------------------------------

        // Event colors
        const eventColors = [
            {
                title: 'Hole 1 / Green / 갱신 / 시비 / 작업자 : 홍길동',
                start: '2020-09-07',
                end: '2020-09-10',
                color: '#2cbacc'
            },
            {
                title: 'Hole 3, Hole 4, Hole 5 / Fairway / 예고 / 시약 / 작업자 : 홍길동',
                start: '2020-09-13',
                end: '2020-09-15',
                color: '#d662a2'
            },
            {
                title: 'Hole 3 / 시약',
                start: '2020-09-13T12:00:00'
            },
            {
                title: 'Hole 5 / 시약',
                start: '2020-09-13T14:30:00'
            },
            {
                title: 'Hole 4 / 시약',
                start: '2020-09-13T17:30:00'
            },
        ];

        // Event background colors
        const eventBackgroundColors = [
            {
                title: 'Business Lunch',
                start: '2020-09-03T13:00:00',
                constraint: 'businessHours'
            },
            {
                title: 'Meeting',
                start: '2020-09-13T11:00:00',
                constraint: 'availableForMeeting', // defined below
                color: '#257e4a'
            },
            {
                title: 'Conference',
                start: '2020-09-18',
                end: '2020-09-20'
            },
            {
                title: 'Party',
                start: '2020-09-29T20:00:00'
            },

            // areas where "Meeting" must be dropped
            {
                groupId: 'availableForMeeting',
                start: '2020-09-11T10:00:00',
                end: '2020-09-11T16:00:00',
                display: 'background'
            },
            {
                groupId: 'availableForMeeting',
                start: '2020-09-13T10:00:00',
                end: '2020-09-13T16:00:00',
                display: 'background'
            },

            // red areas where no events can be dropped
            {
                start: '2020-09-24',
                end: '2020-09-28',
                overlap: false,
                display: 'background',
                color: '#ff9f89'
            },
            {
                start: '2020-09-06',
                end: '2020-09-08',
                overlap: false,
                display: 'background',
                color: '#ff9f89'
            }
        ];


        // Initialization
        // ------------------------------

        //
        // Event colors
        //

        // Define element
        const calendarEventColorsElement = document.querySelector('.fullcalendar-event-colors');

        // Initialize
        if(calendarEventColorsElement) {
            const calendarEventColorsInit = new FullCalendar.Calendar(calendarEventColorsElement, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                initialDate: '2020-09-12',
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: true,
                selectable: true,
                editable: true,
                direction: document.dir == 'rtl' ? 'rtl' : 'ltr',
                events: eventColors
            });

            // Init
            calendarEventColorsInit.render();

            // Resize calendar when sidebar toggler is clicked
            $('.sidebar-control').on('click', function() {
                calendarEventColorsInit.updateSize();
            });
        }


        //
        // Event background colors
        //

        // Define element
        const calendarEventBgColorsElement = document.querySelector('.fullcalendar-background-colors');

        // Initialize
        if(calendarEventBgColorsElement) {
            const calendarEventBgColorsInit = new FullCalendar.Calendar(calendarEventBgColorsElement, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: '2020-09-12',
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: true,
                selectable: true,
                direction: document.dir == 'rtl' ? 'rtl' : 'ltr',
                events: eventBackgroundColors
            });

            // Init
            calendarEventBgColorsInit.render();

            // Resize calendar when sidebar toggler is clicked
            $('.sidebar-control').on('click', function() {
                calendarEventBgColorsInit.updateSize();
            });
        }
    };


    //
    // Return objects assigned to module
    //

    return {
        init: function() {
            _componentFullCalendarStyling();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
    FullCalendarStyling.init();
});
