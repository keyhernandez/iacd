package LosSalias



import org.junit.*
import grails.test.mixin.*

@TestFor(SecRoleController)
@Mock(SecRole)
class SecRoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secRoleInstanceList.size() == 0
        assert model.secRoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secRoleInstance != null
        assert view == '/secRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secRole/show/1'
        assert controller.flash.message != null
        assert SecRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secRole/list'

        populateValidParams(params)
        def secRole = new SecRole(params)

        assert secRole.save() != null

        params.id = secRole.id

        def model = controller.show()

        assert model.secRoleInstance == secRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secRole/list'

        populateValidParams(params)
        def secRole = new SecRole(params)

        assert secRole.save() != null

        params.id = secRole.id

        def model = controller.edit()

        assert model.secRoleInstance == secRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secRole/list'

        response.reset()

        populateValidParams(params)
        def secRole = new SecRole(params)

        assert secRole.save() != null

        // test invalid parameters in update
        params.id = secRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secRole/edit"
        assert model.secRoleInstance != null

        secRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secRole/show/$secRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secRole.clearErrors()

        populateValidParams(params)
        params.id = secRole.id
        params.version = -1
        controller.update()

        assert view == "/secRole/edit"
        assert model.secRoleInstance != null
        assert model.secRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secRole/list'

        response.reset()

        populateValidParams(params)
        def secRole = new SecRole(params)

        assert secRole.save() != null
        assert SecRole.count() == 1

        params.id = secRole.id

        controller.delete()

        assert SecRole.count() == 0
        assert SecRole.get(secRole.id) == null
        assert response.redirectedUrl == '/secRole/list'
    }
}
