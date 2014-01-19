package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(SalonController)
@Mock(Salon)
class SalonControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/salon/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.salonInstanceList.size() == 0
        assert model.salonInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.salonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.salonInstance != null
        assert view == '/salon/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/salon/show/1'
        assert controller.flash.message != null
        assert Salon.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/salon/list'

        populateValidParams(params)
        def salon = new Salon(params)

        assert salon.save() != null

        params.id = salon.id

        def model = controller.show()

        assert model.salonInstance == salon
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/salon/list'

        populateValidParams(params)
        def salon = new Salon(params)

        assert salon.save() != null

        params.id = salon.id

        def model = controller.edit()

        assert model.salonInstance == salon
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/salon/list'

        response.reset()

        populateValidParams(params)
        def salon = new Salon(params)

        assert salon.save() != null

        // test invalid parameters in update
        params.id = salon.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/salon/edit"
        assert model.salonInstance != null

        salon.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/salon/show/$salon.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        salon.clearErrors()

        populateValidParams(params)
        params.id = salon.id
        params.version = -1
        controller.update()

        assert view == "/salon/edit"
        assert model.salonInstance != null
        assert model.salonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/salon/list'

        response.reset()

        populateValidParams(params)
        def salon = new Salon(params)

        assert salon.save() != null
        assert Salon.count() == 1

        params.id = salon.id

        controller.delete()

        assert Salon.count() == 0
        assert Salon.get(salon.id) == null
        assert response.redirectedUrl == '/salon/list'
    }
}
